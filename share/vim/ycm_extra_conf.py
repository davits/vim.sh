# This is is an example file of how flags file should look like
# write your own for your projects
import os
import os.path

flags = [
'-Wall',
'-Wextra',
'-Werror',
#'-Wc++98-compat',
#'-Wno-long-long',
#'-Wno-variadic-macros',
#'-fexceptions',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c++',
# Define platform to amd64
'-Damd64',
#'-fno-ident',
# Define GCC version macros and standard library include paths
'-U__GNUC__',
'-U__GNUC_MINOR__',
'-U__GNUC_PATCHLEVEL__',
'-D__GNUC__=4',
'-U__GNUC_PATCHLEVEL__',
'-D__GNUC__=4',
'-D__GNUC_MINOR__=7',
'-D__GNUC_PATCHLEVEL__=2',
'-nostdinc++',
'-isystem',
'/gcc_path/include/c++/4.7.2',
'-isystem',
'/gcc_path/include/c++/4.7.2/x86_64-redhat-linux',
'-isystem',
'/gcc_path/include/c++/4.7.2/backward'
]


def FlagsForFile( filename ):
  final_flags = AddLocalProjects(flags, filename)
  return {
    'flags': final_flags,
    'do_cache': True
  }
