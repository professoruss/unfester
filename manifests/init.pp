define unfester (
  $path,
  $cut_path    = '/bin/cut',
  $chattr_path = '/usr/bin/chattr',
  $lsattr_path = '/usr/bin/lsattr'
  ) {
  exec { "${title}":
    command => "${chattr_path} -i ${path}",
    onlyif  => "[ `${lsattr_path} ${path} | ${cut_path} -c5` = 'i' ]",
  }
}
