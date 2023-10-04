class Post < ApplicationRecord

  has_one_attached :image #imageカラムが追記されたかのように扱うことができる
  enum open_status: { open: 0, unopened: 1, full_disclosure: 2 }
  enum level_status: { mild: 0, moderate: 1, severe: 2 }

end
