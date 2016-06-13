# == Define: nfs::export
#
# Exports NFS share.
#
# === Parameters
#
# [*export*]
#  A hash of hosts and options for an export. Allows one to specify
#  a single nfs export with multiple hosts & options per host
#
# === Examples
#
# include nfs::server
#
# nfs::export { '/data/nfs':
#   export => {
#     # host           options
#     '10.1.1.0/24' => 'rw,sync,no_root_squash,no_subtree_check',
#     '192.168.1.1' => 'ro,async',
#   },
# }
#
# === Authors
#
# Sergey Stankevich
# Steffen L. Norgren
#
define nfs::export (
  $export = {},
) {

  concat::fragment { "nfs_export_${name}":
    target  => '/etc/exports',
    order   => '10',
    content => template('nfs/exports.erb'),
  }

}
