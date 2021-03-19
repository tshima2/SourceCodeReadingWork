require "slack-notify"
require 'clockwork'
require 'dotenv'

# 下記のgemをrequireすると、minutesなどの時間を指し示すメソッドを使えるようになるので、記述しておくことを推奨します。
require 'active_support/time'

Dotenv.load! ".env"
SourceCodeReadingSeriesWork_Url = ENV["URL"]
EducationalProgramChannel_Name = ENV["CHANNEL"]


module Clockwork
  # ここに、「どれくらいの周期で処理をするのか？」というClockworkのメソッドを記述します
  # ここに、slackで一定時間ごとに送りたい処理と設定を書き込みます
  every(3.minutes, 'SayHi') do
    sample = SlackNotify::Client.new(webhook_url: SourceCodeReadingSeriesWork_Url)
    sample.notify("Hi guys :wave:", EducationalProgramChannel_Name)
  end

end
