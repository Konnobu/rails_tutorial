class HelloController < ApplicationController
  def index
    render text: 'こんにちは、世界！'
  end

  def view
    @msg = '世界の車窓から'
  end

  def list
    # TODO: あとで改善する
    @books = Book.all
  end
end
