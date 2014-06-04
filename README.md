FHV-Thesis-LaTeX
================

A LaTeX based template for FH Vorarlberg students writing their thesis.

I've took the official layout and adapted it to my needs. This mainly
includes a purpose-driven folder structure.

This version should be used if you intend to write your thesis in `English`.
There is also a `German` version: https://github.com/lumannnn/FHV-Thesis-LaTeX-GER

Structure
---------

The main layout can be changed by altering the layout/structure of
``main.tex``.

I like to have many smaller files. Therefore, I create a file for each
chapter, and name the file accordingly. Such files would be located in the
``content`` folder. ``main.tex`` includes ``content/_content`` as a  'place
holder'. ``content/_content.tex`` includes the actual smaller chapters.
This worked out pretty well since you do not have to manage one big file.
Additionally, a subfolder ``content/image`` could contain all images.
Of course, you can alter the structure as you like.

How To
======

A little script helps you to build and compile the thesis. Currently, PDF
as output is supported.

This project/template is optimised for *nix systems. If you do write your
thesis on Windows, please consider to contribute (contributions are
appreciated by everyone :)).

Requirements
------------

The Makefile can help you to compile the thesis and create a PDF.
By default, you need to have the following software installed:

 - pdflatex
 - bibtex
 - biber

Compile your thesis
-------------------

To compile your thesis and generate a PDF, simply run:

    make pdf

This creates (if not exists) a folder ``./pdf`` and moves the PDF into that
folder. The generated PDF name and location can be change in the
``Makefile`` by changing `PROJECTNAME` or `OUT_DIR` respectively.


Any questions?
--------------

Feel free to open a Github issue or say hello:

- https://twitter.com/lukasender
- hello@lukasender.at

