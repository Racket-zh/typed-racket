#lang scribble/manual

@(require "../utils.rkt" (for-label (only-meta-in 0 typed/racket)))
@(provide typed-mod)

@title[#:tag "quick"]{快速开始typed-racket}

在 @racketmodname[racket] 中的模块使用typed racket, 遵循以下的步骤：

@itemize[#:style
         'ordered
         @item{将language修改为 @racketmodname[typed/racket].}
         @item{将 @racket[(require mod)] 改为
           @racket[(require typed/mod)].}
         @item{给结构和顶层定义加上类型签名} ]

然后，程序执行前就会自动检查它的类型，如果发生任何类型错误，则报告错误，
停止执行。


这是一个 @racketmodname[racket] 中的例子：

@(define typed-mod
@racketmod[
typed/racket
(struct pt ([x : Real] [y : Real]))

(: distance (-> pt pt Real))
(define (distance p1 p2)
  (sqrt (+ (sqr (- (pt-x p2) (pt-x p1)))
           (sqr (- (pt-y p2) (pt-y p1))))))
]
)

@racketmod[
racket
(struct pt (x y))

(code:contract distance : pt pt -> real)
(define (distance p1 p2)
  (sqrt (+ (sqr (- (pt-x p2) (pt-x p1)))
           (sqr (- (pt-y p2) (pt-y p1))))))
]

这是相同的用 @racketmodname[typed/racket] 写的例子:

@|typed-mod|

@section{在Racket REPL中使用typed racket}

我们可以在在Racket REPL中使用Typed Racket，只要在开启racket时
使用如下命令行：
@commandline{racket -I typed/racket}
