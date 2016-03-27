# GMT5参考手册

**本项目已转移至GMT中文社区，见 https://github.com/gmt-china/GMT_docs**

这是介绍GMT5的语法及用法的中文手册。

## 简介

本项目源码用 [reStructuredText](http://docutils.sourceforge.net/rst.html) 写成，
利用 [Sphinx](http://sphinx-doc.org/) 制作成网页，源码托管在
[GitHub](https://github.com/seisman/GMT5_Docs) 上，网页渲染及托管由
[Read the Docs](http://readthedocs.org/projects/gmt5-docs/) 提供。

- 项目源码：https://github.com/seisman/GMT5_Docs
- 项目主页：http://gmt5.seisman.info/
- 我的博客：http://seisman.info

## 编译

通过如下方式即可实现本地编译：

1. Clone项目到本地

   ~~~bash
   $ git clone https://github.com/seisman/GMT5_Docs.git
   ~~~

1. 安装依赖

   ~~~bash
   $ pip install sphinx sphinx_rtd_theme pygments
   ~~~

2. 编译生成HTML

   ~~~bash
   $ make html
   $ firefox build/html/index.html&
   ~~~

3. 编译生成PDF（要求安装TeXLive 2015）

   ~~~bash
   $ make xelatexpdf
   $ evince build/latex/GMT5_Docs.pdf&
   ~~~

## 说明

1. ReadTheDocs可以自动生成中文PDF，但ReadTheDocs服务器里的TeXLive版本太老，导致
   只能使用 `pdflatex` 而不能使用 `xelatex` 编译，再加上服务器上中文字体的限制，
   所以生成的PDF效果较差，故不采用ReadTheDocs生成的PDF
2. 本地安装TeXLive 2015，用 `xelatex` 编译，可生成更好效果的PDF。目前的策略是在本地
   生成PDF，然后上传到FTP中供下载。
3. Repo中包含了PNG和PDF格式的图片。PNG格式供网页版使用，PDF格式供PDF版使用。之所以这样
   做，主要是因为LaTeX中插入PDF要比插入PNG快很多，实测编译时间为90s vs 450 s
