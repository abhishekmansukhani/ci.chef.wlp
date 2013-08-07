# Cookbook Name:: wlp
# Attributes:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

action :add do
  @jvmOptions.add(new_resource.option)

  new_resource.updated_by_last_action(true) if @jvmOptions.save
end

action :remove do
  @jvmOptions.remove(new_resource.option)

  new_resource.updated_by_last_action(true) if @jvmOptions.save
end

def load_current_resource
  @jvmOptions = Liberty::JvmOptions.new(node, new_resource.server_name)
end