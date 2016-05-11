class RecordController < ApplicationController
  def find
    @books = Book.find([2,5,10])
    render 'hello/list'
  end

  def find_by
    @book = Book.find_by(publish: '技術評論社')
    render 'books/show'
  end

  def find_by2
    @book = Book.find_by(publish: '日経BP社')
    render 'books/show'
  end

  def where
    @books = Book.where(publish: ['技術評論社','翔泳社'])
    render 'hello/list'
  end

  def ph1
    @books = Book.where('publish = :publish AND price >= :price', publish: params[:publish], price: params[:price])
    render 'hello/list'
  end

  def not
    @books = Book.where.not(isbn: params[:id])
    render 'books/index'
  end

  def order
    @books = Book.where(publish: '技術評論社').order(published: :desc)
    render 'hello/list'
  end

  def reorder
    @books = Book.order(:publish).reorder(:price)
    render 'books/index'
  end

  def select
    @books = Book.where('price >= 2000').select(:title, :price)
  end

  def select2
    @pubs = Book.select(:publish).distinct.order(:publish)
  end

  def offset
    @books = Book.order(published: :desc).limit(3).offset(4)
    render 'hello/list'
  end

  def page
    page_size = 3 # ページあたりの表示件数
    page_num = params[:id] == nil ? 0 :params[:id].to_i - 1 # 現在のページ数
    @books = Book.order(published: :desc).limit(page_size).offset(page_size * page_num)
    render 'hello/list'
  end

  def last
    @book = Book.order(published: :desc).last
    render 'books/show'
  end

  def groupby
    @books = Book.select('publish, AVG(price) AS avg_price').group(:publish)
  end

  def havingby
    @books = Book.select('publish, AVG(price) AS avg_price').group(:publish).having('AVG(price) >= ?', 2500)
    render 'record/groupby'
  end

  def unscope
    @books = Book.where(publish: '技術評論社').order(:price).select(:isbn, :title).unscope(:where, :select)
    render 'books/index'
  end

  def unscope2
    @books = Book.where(publish: '技術評論社', cd: true).order(:price).unscope(where: :cd)
    render 'books/index'
  end

  def none
    case params[:id]
      when 'all'
        @books = Book.all
      when 'new'
        @books = Book.order('published DESC').limit(5)
      when 'cheap'
        @books = Book.order(:price).limit(5)
      else
        @books = Book.none
    end

    render 'books/index'
  end

end
