#!/bin/bash -xe

workspace="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

target_basedir=${workspace}/target

repo=yewton
image_prefix=swagger-top-down-playground-

images=(node-tools)
for image in ${images[@]}; do
  docker build -t ${repo}/${image_prefix}${image} ${workspace}/docker/${image}
done

environments=(staging production)
for env in ${environments[@]}; do
  target_dir=${target_basedir}/${env}

  swagger_dir=${target_dir}/swagger
  spec_dir=${workspace}/api_spec
  mkdir -p ${swagger_dir}
  docker run --rm \
         -v ${swagger_dir}:/gen \
         -v ${spec_dir}:/api_spec \
         -e "RAILS_ENV=${env}" yewton/swagger-blocks_ext \
         swagger:gen[/gen/swagger.yaml,/api_spec/root,/api_spec/descriptions]

  server_dir=${target_dir}/server
  mkdir -p ${server_dir}
  docker run --rm \
             -v ${swagger_dir}:/spec \
             -v ${server_dir}:/gen \
             -v ${workspace}/codegen/templates:/templates \
             yewton/swagger-codegen:v2.1.4 generate -i /spec/swagger.yaml \
                                                    -o /gen \
                                                    -t /templates/nodejs \
                                                    -l nodejs
  echo 'web: node index.js' > ${server_dir}/Procfile

  html_dir=${target_dir}/html
  mkdir -p ${html_dir}
  docker run --rm \
             -v ${swagger_dir}:/spec \
             -v ${html_dir}:/gen \
             -v ${workspace}/bootprint:/bootprint \
             ${repo}/${image_prefix}node-tools bootprint swagger -f /bootprint/config.js /spec/swagger.yaml /gen
done
