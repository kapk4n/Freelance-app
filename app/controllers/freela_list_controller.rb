class FreelaListController < ApplicationController
  def index
    @freelancers = Freelancer.all
    @categories_of_freelancers = Freelancer.categories
    @experience_of_freelansers = Freelancer.experiencs
  end

  def show
    # if params[:flexCheckDefault]
    # redirect_to root_path, notice:'good'
  end

  def filter
    @freelancers = Freelancer.all
    @categories_of_freelancers = Freelancer.categories
    @experience_of_freelansers = Freelancer.experiencs

    # @array_of_result = []
    # unless params[:role_ids].nil?
    #     params[:role_ids].each do |i|
    #       @array_of_result += @freelancers.where("category LIKE :filt", filt: i.split(' ')[1].to_i)
    #     end
    #   @result = []
    #   @result = @array_of_result.find_all{|i| i.stack.downcase.include?"#{params[:search_param]}".downcase }
    #   @result |= @array_of_result.find_all{|i| i.info.downcase.include?"#{params[:search_param]}".downcase }
    #   @array_of_result = @result
    # else
    #   @result = []
    #   @result = @freelancers.find_all{|i| i.stack.downcase.include?"#{params[:search_param]}".downcase }
    #   @result |= @freelancers.find_all{|i| i.info.downcase.include?"#{params[:search_param]}".downcase }
    #   @array_of_result = @result
    # end

    # params[:role_ids].each do |i|
    # a = params[:role_ids].map(&:split)
    # @array_of_result = @freelancers.where(["category = ? or category = ? or category = ?", a[0][1].to_i, a[1][1].to_i, a[2][1].to_i])
    # end
    # redirect_to root_path, notice: params[:role_ids].map(&:split)[0][1].to_i
    # redirect_to root_path, notice: a[4].nil? ? nil : a[4][1]


    # @array_of_result = @freelancers.where(["category = ? or category = ? or category = ? or category = ? or category = ? or category = ? or category = ? or category = ? or category = ?", 
    #   a[0].nil? ? nil : a[0][1].to_i, a[1].nil? ? nil : a[1][1].to_i, a[2].nil? ? nil : a[2][1].to_i,
    #    a[3].nil? ? nil : a[3][1].to_i, a[4].nil? ? nil : a[4][1].to_i, a[5].nil? ? nil : a[5][1].to_i, a[6].nil? ? nil : a[6][1].to_i, a[7].nil? ? nil : a[7][1].to_i, a[8].nil? ? nil : a[8][1].to_i])








    a = Freelancer.all
    # b = []
    # unless params[:check_category].nil?
    # # unless params[:check_busy].nil?
    #   params[:check_category].map(&:split).each do |i|
    #     b |= a.where(category: i[1].to_i)
    #   end
    #   # params[:check_busy].map(&:split).each do |i|
    #   #   b |= a.where(status: i[1].to_i)
    #   # end
    #   b = b.find_all{|i| i.stack.downcase.include?"#{params[:search_param]}".downcase }
    #   b |= b.find_all{|i| i.info.downcase.include?"#{params[:search_param]}".downcase }  
    # else 
    #   b = a.find_all{|i| i.stack.downcase.include?"#{params[:search_param]}".downcase }
    #   b |= b.find_all{|i| i.info.downcase.include?"#{params[:search_param]}".downcase }
    # end

    # @array_of_result = b




    # redirect_to root_path, notice: a.where(status: params[:check_busy].map(&:split)[0][1].to_i)
    # b = a.where(status: params[:check_busy].map(&:split)[0][1].to_i)

      
      
      unless params[:check_category].nil?
        b = []
        params[:check_category].map(&:split).each do |i|
          b |= a.where(category: i[1].to_i)
        end
      else
        b = a
      end

      unless params[:check_busy].nil?
        c = [] 
        params[:check_busy].map(&:split).each do |i|
          c |= a.where(status: i[1].to_i)
        end
      else
        c = a
      end

      # fre_list = Review.all
      # unless params[:check_review].nil?
      #   extra_d = []
      #   params[:check_review].each do |i|
      #     extra_d |= fre_list.select(:freelancer_id).distinct.where(mark: i)
      #   end
      # else
      #   d = a
      # end

      unless params[:check_review].nil?
        d = []
        @freelancers.each do |i|
          marks = Review.where(freelancer_id: i.id)
          adr_marks = 0.0
          if marks != []
            marks.each do |rev|
              adr_marks += rev.mark
            end
            adr_marks /= marks.count
          end
          (adr_marks + 0.5 > params[:check_review][0].to_f) ? d |= [i] : nil
        end
      else
        d = a
      end

      # unless extra_d.nil?
      #   d = []
      #   extra_d.each do |i|
      #     d |= [(i.freelancer)].to_a
      #   end
      # else
        # d = a
      # end

      unless params[:check_experienc].nil?
        e = []
        params[:check_experienc].map(&:split).each do |i|
          e |= a.where(experienc: i[1].to_i)
        end
      else
        e = a
      end

        f1 = a.find_all{|i| i.stack.downcase.include?"#{params[:search_param]}".downcase }
        f2 = a.find_all{|i| i.info.downcase.include?"#{params[:search_param]}".downcase }

      @array_of_result = b & c & d & (f1 | f2) & e
    # @freelancers.where(["category = ? or category = ? or category = ?", ])
  end
end

# @result = []
# # @result_stack_freelancer = @array_of_searching.where("stack LIKE :search", search: "%#{params[:search_param]}%")
# @result |= @array.find_all{|i| i.stack.downcase.include?"#{params[:search_param]}".downcase }
# # @result_info_freelancer = @array_of_searching.where("info LIKE :search", search: "%#{params[:search_param]}%")
# @result |= @array.find_all{|i| i.info.downcase.include?"#{params[:search_param]}".downcase }
# @array |= @array