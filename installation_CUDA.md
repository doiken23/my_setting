# installation of CUDA

## デフォルトドライバの停止
/etc/modprobe.d/blacklist-nouveau.confを作成し、以下の文を書いて保存。
<pre>
blacklist nouveau
options nouveau modeset=0
</pre>

## セキュアブートで起動

BIOSをいじってマシンをセキュアブートで起動する。（以下のコマンドを実行するとこれはやらなくていいかも。）

<pre>
sudo apt-get install mokutil
sudo mokutil --disable-validation
</pre>

## CUDAインストール

1. NVIDIAのページからCUDAのインストーラ(runファイル)をダウンロードしておく
1. 下のコマンドでX serverをシャットダウン。（画面が暗転するのでCtrl+Alt+F1でターミナルを開く。）

<pre> sudo service lightdm stop </pre>

3. CUDAインストーラがあるディレクトリで以下のコマンドを実行。

<pre>
chmod u+x cuda****.sh
sudo ./cuda****.sh
</pre>

4. インストーラに従い進めていく。成功したら再起動。

デフォルトドライバの停止、セキュアブート、Xserverのシャットダウンのうち一つでも欠けると失敗する。最悪の場合ログインできなくなる。
ログインできなくなったらログイン画面でCtrl+Alt+F1を実行しCUIで操作すれば大丈夫。

## cuDNNのインストール

cuDNNがあるとCUDAの計算が早くなるらしい。
1. cuDNNをNVIDIAのページからダウンロード
    - 会員登録が必要
    - cuDNNバージョンはCUDAと対応しているか確認
1. cuDNN v** Library for Linuxを解凍

<pre> tar xzvf cudnn-**.tgz </pre>

3. 解凍されたファイルをcudaのディレクトリにコピーし、読み込みの権限を解除

<pre>
cd cuda # 解凍されたディレクトリ
sudo cp ./include/cudnn.h /usr/local/cuda/include
sudo cp ./lib64/* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
</pre>

# パスの追加

<pre>
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/cuda/include:$LIBRARY_PATH
</pre>

# 便利コマンド

- nvidia-smi: GPUの使用状況を確認する

<pre>
hoge@fuga:~$ nvidia-smi
Thu Mar 15 18:36:32 2018
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 387.26                 Driver Version: 387.26                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  Quadro P5000        Off  | 00000000:03:00.0  On |                  Off |
| 53%   82C    P0   173W / 180W |  13925MiB / 16264MiB |     99%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|    0      1417      G   /usr/lib/xorg/Xorg                           162MiB |
|    0      2194      G   compiz                                       107MiB |
|    0      9841      C   python                                     12763MiB |
|    0     13781      C   python                                       483MiB |
|    0     14721      C   python                                       381MiB |
+-----------------------------------------------------------------------------+
</pre>

- nvcc -V: CUDAのバージョン確認

<pre>
hoge@fuga:~$ nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2017 NVIDIA Corporation
Built on Fri_Nov__3_21:07:56_CDT_2017
Cuda compilation tools, release 9.1, V9.1.85
</pre>

# nvidiaドライバが認識されなくなった時の対処法

<https://qiita.com/bohemian916/items/7637b9b0b3494f447c03>
