function build_rpm() {
  set -ouex pipefail

  spec_file=$1
  out_dir=$2

  build_dir=$(mktemp -d /tmp/build_rpm_XXXXXXXXXX)
  define_str="_topdir $build_dir"
  echo $define_str

  # setup build tree
  mkdir -p $build_dir/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

  # install dependencies
  dnf builddep -y $spec_file


  # build the package
  rpmbuild -ba \
    --define "$define_str" \
    --undefine "_disable_source_fetch" \
    --define "_unpackaged_files_terminate_build 0" \
    --define "debug_package %{nil}" \
    $spec_file

  # copy the built RPMs to the output directory
  mkdir -p $out_dir
  cp -r $build_dir/RPMS/*/*.rpm $out_dir
}