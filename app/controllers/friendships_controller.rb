class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
    @friendship = Friendship.new
    @user = current_user
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    
    @x = params[:friendship]
    user_res = User.find_by_email(@x[:email])

    if user_res.id == current_user.id
      respond_to do |format|
        redirect_to friendships_path
        return
      end
    end

    if user_res

      friendship_res = Friendship.find_by(friend_id:user_res.id,user_id:current_user)

      if friendship_res == nil
        @friendship = current_user.friendships.build({friend_id: user_res.id})
        respond_to do |format|
          if @friendship.save
            format.html { redirect_to friendships_path, notice: 'Friendship was successfully created.' }
            format.json { render :show, status: :created, location: @friendship }
          else
            format.html { render :new }
            format.json { render json: @friendship.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to friendships_path, notice: 'User already exists.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to friendships_path, notice: 'There is no user with this email.' }
      end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

end
