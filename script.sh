#!/bin/bash

source .venv/bin/activate
uv pip install torch torchvision sentencepiece
uv pip install -r requirements.txt
uv pip install -e .

cd hy3dgen/texgen/custom_rasterizer
python setup.py install
cd ../../..
cd hy3dgen/texgen/differentiable_renderer
python setup.py install

cd ../../..

python gradio_app.py --model_path tencent/Hunyuan3D-2mv --subfolder hunyuan3d-dit-v2-mv --texgen_model_path tencent/Hunyuan3D-2 --low_vram_mode --enable_t23d
