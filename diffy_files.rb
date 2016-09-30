require 'digest'

def name root
  path_file1 = File.join(root,'**','*.*')
  assets_list1 = Dir.glob(path_file1)

  # p 'st1_list: ',assets_list1

  assets_list1.each { |item|
    path = item
    contents=''
    File.open(path,'r'){ |f| contents = f.read }
    key = Digest::SHA256.hexdigest contents
    puts path+':'+key
  }

end


name ARGV[0]
