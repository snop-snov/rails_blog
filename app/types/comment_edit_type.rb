class CommentEditType < Post::Comment
  include BaseType

  permit :body, :parent_id
end
