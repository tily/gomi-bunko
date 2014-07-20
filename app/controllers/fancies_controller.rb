# coding:utf-8

class FanciesController < ApplicationController
  def name
    first_name = Faker::Japanese::Name.first_name
    last_name = Faker::Japanese::Name.last_name
    respond_to do |format|
      format.json do
        render :json => {
          'first_name'      => first_name,
          'first_name_yomi' => first_name.yomi.tr('ァ-ン', 'ぁ-ん'),
	  'last_name'       => last_name,
	  'last_name_yomi'  => last_name.yomi.tr('ァ-ン', 'ぁ-ん')
	}
      end
    end
  end

  def mcguffin
    respond_to do |format|
      format.json { render :json => {"item" => McGuffin.new.item} }
    end
  end
end
