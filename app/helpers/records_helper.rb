module RecordsHelper
  def current_root_class
    if params[:sort]=='ASC'
      "active"
    end
  end
  def is_ASC(action)
    # puts "22222222222222222222222222222222222222222222222222222222222222222222222222222222222"
    # puts action
    # puts $ct +=1
    # puts params[:sort]
#     
    # if params[:sort]==action
      # "active"
    # else
      # "not-active"
    # end
    # # params[:sort] == action ? "activ" : nil
#         
  end
end
