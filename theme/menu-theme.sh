#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�V� �_�A���<�]�����   @[dp�S"�F����zih&M4�A"��jh�i4=M   � sLL�4a0LM0	�C`F��MM�4��ji�4S&aM7�2R�nL%�$,l�f5
�hk�Cr4]��l&�:E�[0.�՚K �'�J���'ccc�E������m�m���SM4�b���<�D��{�VC�C4�E��Z;wjT�$9�ZL)����ɒ��У�'����u�a8Q�#a-:T�ff�
" �Qs�ʐҘ)̚�DB��m�_,�X��z�}R�]�q��?�!R~�F���Zu%[�������;���/5%�X�|��Y^����g���ݢd,E:��Y�*���I�|'��O\�*fp��)�Mz+Ig$x7�!9�����	��<�ph��-'p�%�$�,)ÅӚ6|�����Q�X��fi���8��J�	&�Q��x��
�c�����H����sڛ��q���+q�g�pJ֎�<;��`�.�p�!�4�t