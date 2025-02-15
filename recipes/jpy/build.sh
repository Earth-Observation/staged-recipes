set -ex

export PBR_VERSION=$PKG_VERSION

cd $SRC_DIR/jpy
# Use PEP 517 to generate the wheel
$PYTHON setup.py --maven bdist_wheel
cd dist/
ls -l 

# Install wheel manually
# $PYTHON -m pip install *.whl

mkdir -p $PREFIX/jpy_wheel
echo $PY_VER > /tmp/p_ver.txt

VER=$( echo $PY_VER | tr -d '.' )

cp -v $( find $SRC_DIR -name "jpy*$VER*$VER*.whl" ) $PREFIX/jpy_wheel 