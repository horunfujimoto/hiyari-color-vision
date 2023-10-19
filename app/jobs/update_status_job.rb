class UpdateStatusJob < ApplicationJob
  queue_as :default

  def perform(member)
  puts "ジョブが実行されました。"
    member.update(is_active: 0)
  end
end