#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'main.sh' encrypted at Thu Feb  1 00:20:28 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SYF�7k ���T�����������w�������������Fآ�YQ@�� ���&"b��=
x���O�?)�M�M��53E=O)����T�OSj6�52h @ ��  d��M4��FL!� F�@�0�� dh`L�	��4440L��4�L	�d�04i�C	��F���0�h�CCA� 	I����S � h   �     2@L��4�L	�d�04i�C	��F���0�h�CCA� 	"M2�h��z��=��OiO#�SmP�	��<Q�2 ���z��@��ת�bF#r}7d�7�N���w�`-��S=�rŚ�f��cޭ�f.���Og������S��Vc�YVh
:j���Ʋ��ي�ѝ���g;������<�۔A9�4D�)��eĤo�B�p�H�-�B)��s�g�F��iղ�l��G����s3>F�w���g֑����3CNh��B\9
�A��:,�}�	�`�S-���k����~�~���;�/7�ڧ � �?%���.����f��aӃ�A�j��΄�x����8��{lk��uJ4"��d��CZ�I�KC8f���
�mjIǣ'�3�E�6���*Nw�7����E���ޅ�*��=�`�#`n�ιvr[�d������܊E"n�y�%h��J1�ek��6r
I����
/�E�k
���3\�]]{�=7i�	�`A���"啺N2�ŀ��#<�h4�N���e50�����ğ��s쨉{!C'$�����[]Jn^1�N�.Ve���((-W�aoJ��ŧ�������q-lN|��L��ȁՂpSC��o�pw�AcH�`D�,��f� Ĝ���0b���8*�A`������b
��ٳ�B�uYH��C0��J��
`U��ഈ�%���;��<����ՒŘ�K�����9Lt�
fe;X��gDi���ۡ�{!$2�m�H�Gv���1Y���61��o���� ���ez��fCN�G�6u�u���ե�9ٌ�03긻��)��x���J�!��/��&R:L��[�c��r�#�㏈iv��˕��a�V���b�Kϩ�~yp��#�:dt�8s��A| T�5��\��YI����l�{)�d8����@�"�P�裀��`��i��._3�"�, �6P0���N��,q"F��S���z� ��a)�,�,�G��A拞ⓙ���_P2
d��.�Q��	��Rr�*��D ��	�$�!�
m���KM�����EؚT~ɷ�Ǟ;�;�X���2=�׉ϲp�1a�v#(iu��F:���PĿA�g��wQ��G������h�Z}d�.�n�:�)���(��w�����:P@�o�R2�@z�X����;��N�`�����RO!�(�#�b+M'�Dc��D�.��G�!�y�c��a���8j���W� �W��J�jg@p8~�ͬ��ϧU��Yg̽-��x^��)7CPpw�`ry�y~Ppz��Vt���Cq�P͈p�5�ƘФ���ą��g2��l߼gp��&PW����{��v��f�e&VQ�(��ı��	�së?�z̷���-�I�͏
G�:���� �['5rhZi낔}CR	UBd�h	��bײ��Л�/��t�mM�8���m2%�b ���L�`Kv��o��ޅ�z/�*Ti_Xq)�Ƒ���HAb���I���m�������e��\`M_0荹���H՜�)"�_�4ܹ7��9�!¢՘�(�$vCh@F4rXk�]�<�2�b��]$%})z���v�C����>�|Vږ�vpԛ�@�˞ ORR��:շ�A�Rw��>���#x�5�א�#=ʂdP1�
��栴t��9 �vA������L��0�<T!��@S�� �s��kڲk�̟"ܘ[X�kK|�Qb
A�L���w�@9+����*�3�J�Qz^OZW,�ߘQLf��e@]�$K�L�vq�Ĥ	SXd0l��T��4��1���0v���%�t��p�$`HS�ݪvE5L��9S�*S�:�V(�:�G�a�#I�Hڎ) �JA� �,��b2�jO x+W�jZ ������UR5+�`��붹`aj7 ��F�y�]�pi*���^�?'	�FA�_Jt���X��i�2Dff2T�(eR=���y��^�/�@��˥����ʰV�h3]�"g<%Xd.:O�&�3k֑	��x�5���Ci�1�DP�=%�/\m@iK�����.i�9��j2�(N^Ap�,�d���Efs25:0�A�r6x��s2b��,F5��κ�ɦ���y�q嫹%/Y�����t����(�$��`o2���;��Ғ�uA۶H��F�N�bĒ̜��o����H*3p��A�e�_B��1N�$����x�R��&�C6n�)"�6��`��b2��3�XXB���P�IIZ�؇��g��Z�e�c�EK��GqТ�ef2̨���m��2]B1��A�VX��3�v�N��P6�!~��R_^fY�"��)UV��i�10��%�Fc#uz���a�à:uqz҇����(�
��H �k�<k���#�_o�<��� N����p5 ��"��zU��|*(�E�~���8�+����I���p�rK��H��73�49�v�3��1E���DL)/-/L�^� �0��.}�o���,-���?:m��oj?�7�Җ�]6X�k�B�s ��Gx�r$;�����9C�R�H�qV�s��B��V�s����X�Q*&�S#�7?⃑����Y�R6;&�J�F ���\[ؑ�"AT�R>q~+m�t�k�7�i98C��%�OE���0�G�Չ�2�)4�7AF0tV��a� Y7
Ê%@���p�T1�
���wa��I?�ש�E,>�ø,�4���R�J���q��-��/�|r82����DF4���4.������gi�|�������ҴF�6�\��Uڈ�D͌�#3��D#��a!9��N`Y�zJ3�F�)CtOFo�H��f�UH�F;p�Ɯ�T�m�D����'JV���} +��)G<����,n`�D��7{�X渭����ZRy��4�|<��\?�����\�:��P%�@W1@���T��o�P��4�;���_�ii�;];զӆ�ϭp���s�rE8P�F�7k