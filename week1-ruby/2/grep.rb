pattern = Regexp.new(ARGV.shift)
ARGF.each { |line| puts line if line =~ pattern }
