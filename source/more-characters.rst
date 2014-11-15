特殊字符
========

能从键盘输入的字符是有限的，比如大小写的26个字母、0-9的阿拉伯数字以及几个常见的符号。除此之外，有时会需要输入一些其他的特殊字符。

八进制码
--------

由于键盘上能用的键都被用来输入常见字符了，所以想要输入特殊字符只能通过组合键来完成。C语言下用\ ``\n``\ 来代表换行符就是一个很熟悉的例子。GMT基于C语言的习惯，使用八进制码来输入特殊字符，比如用\ ``\100``\ 就可以用来表示一个字符。但是怎么知道某个八进制码代表哪个字符呢？这就牵涉到字符编码的问题。GMT支持两种字符编码：Standard+和ISOLatin1+，当前使用的字符编码方式由GMT默认参数\ :ref:`PS_CHAR_ENCODING <PS_CHAR_ENCODING>`\ 来决定。若安装过程中使用的是SI单位制，则默认编码方式为ISOLatin1，否则为Standard+。

下图给出了Standard+和ISOLatin1+编码下不同字符所对应的八进制表示：

.. figure:: /images/GMT_stand+_iso+.jpg
   :width: 600px
   :align: center

   Standard和ISOLatin1编码下的八进制码

这张图应该如何读呢？以ISOLation1编码下的八进制码\ ``\144``\ 为例，\ ``\14x``\ 与\ ``4``\ 的交界处就是该八进制码代表的字符，即\ ``d``\ 。

这样就可以很容易的通过八进制码来输入一些常用字符和特殊字符了。需要强调的是，编码与字体是两个不同的概念，所以对于这些特殊字符来说，依然可以选择不同的字体（12号和34号字体除外）。

下图给出了如何用八进制码来表示常见字符和特殊字符：

.. figure:: /images/octal_examples.*
   :width: 600 px
   :align: center

   八进制示例

12号字体与34号字体
------------------

前面已经多次提到12号字体和34号字体比较特殊，这里说说这两种字体特殊在哪里。

在某种程度上，可以认为这两种字体是与Standard+和ISOLatin1+并列的两种编码，只是这里不是通过修改\ :ref:`PS_CHAR_ENCODING <PS_CHAR_ENCODING>`\ 来修改编码，而是通过修改字体号为12或34来实现。

下图给出了Symbol字符集（12号字体）和Pifont ZapfDingbats（34号字体）的八进制码图表：

.. figure:: /images/GMT_symbol_dingbats.*
   :width: 600 px
   :align: center

   Symbol和Pifont字体八进制码

下图给出了一些示例：

.. figure:: /images/symbol_examples.*
   :width: 500 px
   :align: center

   12号和34号字体示例
