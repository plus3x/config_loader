# frozen_string_literal: true

require_relative '../../lib/custom_config_parser'

class ConfigLoadController < ApplicationController
  # GET /config_load
  def new
  end

  # POST /config_load
  def create
    text = settings_load_params[:text]

    settings =
      begin
        CustomConfigParser.parse(text)
      rescue => e
        flash[:warn] = "Problem with parsing(#{e})"
        render :new
        return
      end

    begin
      Setting.transaction do
        settings.each do |name, value|
          s = Setting.find_or_initialize_by(name: name)
          s.value = value
          s.save!
        end
      end
    rescue => e
      flash[:warn] = "Problem saving settings(#{e})"
      render :new
    end

    redirect_to settings_url, notice: 'Config successfuly loaded'
  end

  private

  def settings_load_params
    params.require(:text)
    params.permit(:text)
  end
end
