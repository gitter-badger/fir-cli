module Fir
  class Cli < Thor
    desc 'info APP_FILE_PATH', '获取应用文件的信息（支持 ipa 文件和 apk 文件）'
    option :all, :aliases => '-a', :desc => '显示全部应用信息', :type => :boolean
    option :fir, :aliases => '-f', :desc => '显示托管在 fir.im 的应用信息', :type => :boolean
    option :verbose, :aliases => '-v', :desc => '设置输出级别 v, vv, vvv'
    option :quiet, :aliases => '-q', :desc => '安静模式，不输出任何选项'
    def info(path)
      app = _info path, options[:all]
      app.each { |i| puts "#{ Paint[i[0].to_s.rjust(18), :blue] }  #{ i[1] }" }
      if options[:fir]
        fir_app = _fir_info app[:identifier], app[:type]
        fir_app.each { |i| puts "#{ Paint[i[0].to_s.rjust(18), :blue] }  #{ i[1] }" }
      end
    end
  end
end
