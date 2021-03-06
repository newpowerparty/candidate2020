Newebpay.configure do |config|
  # 預設商店代號
  config.merchant_id = ENV['NEWEBPAY_MERCHANT_ID']
  # Hash Key
  config.hash_key = ENV['NEWEBPAY_HASH_KEY']
  # Hash IV
  config.hash_iv = ENV['NEWEBPAY_HASH_IV']


  # for development 測試環境
  config.mpg_gateway_url = 'https://ccore.newebpay.com/MPG/mpg_gateway' #MPG金流
  config.periodical_gateway_url = 'https://ccore.newebpay.com/MPG/period' #定期定額
  config.query_trade_url = "https://ccore.newebpay.com/API/QueryTradeInfo" #交易狀態查詢
  config.cancel_auth_url = "https://ccore.newebpay.com/API/CreditCard/Cancel" #信用卡取消授權
  config.close_fund_url = "https://ccore.newebpay.com/API/CreditCard/Close" #信用卡請退款

  # for production 正式環境
  # config.mpg_gateway_url = "https://core.newebpay.com/MPG/mpg_gateway" #MPG金流
  # config.period_gateway_url = "https://core.newebpay.com/MPG/period" #定期定額
  # config.query_trade_url = "https://core.newebpay.com/API/QueryTradeInfo" #交易狀態查詢
  # config.cancel_auth_url = "https://core.newebpay.com/API/CreditCard/Cancel" #信用卡取消授權
  # config.request_fund_url = "https://core.newebpay.com/API/CreditCard/Close" #信用卡請退款

  # 支付完成後使用者導回到網站觸發的callback（前景）
  config.mpg_callback do |newebpay_response|
    # 若已在 notify_callback 中處理資料更新或商業邏輯，請勿在此重複處理。
    # 使用者完成付款後(notify_callback)，使用者導回到網站頁面(mpg_callback)。
    #
    # 範例，假設已在notify_callback中處理商業邏輯
    # if newebpay_response.success?
    #   flash[:success] = newebpay_response.message
    # else
    #   flash[:error] = newebpay_response.message
    # end
    #
    # redirect_to root_path
  end


  # #付款後觸發的callback（背景）。若僅使用即時交易支付方式，且已在 mpg_callback 中處理商業邏輯，可忽略此設定。
  #
  # config.notify_callback do |newebpay_response|
  #   # 範例
  #
  #   if newebpay_response.success?
  #     Order.find_by(serial: newebpay_response.result.merchant_order_no)
  #          .update_attributes!(paid: true)
  #   else
  #     Rails.logger.info "Newebpay Payment Not Succeed: #{newebpay_response.status}: #{newebpay_response.message} (#{newebpay_response.result.to_json})"
  #   end
  # end

  #取號完成觸發的callback。 接收 ATM轉帳(VACC)、超商代碼繳費(CVS)、超商條碼繳費 (BARCODE)、超商取貨付款(CVSCOM) 的付款資訊
  #若想直接在藍新金流頁面顯示付款資訊，且使用者不需回到網站，可忽略此設定。
  
  # config.payment_code_callback do |newebpay_response|
  #   # 範例
  
  #   if newebpay_response.success? && newebpay_response.result.payment_type == 'VACC'
  
  #     bank_code = newebpay_response.result.bank_code
  #     account_number = newebpay_response.result.code_no

  #     expired_at =
  #       DateTime.parse("#{newebpay_response.result.expire_date} #{newebpay_response.result.expire_time} UTC+8")

  #     Donation.find_by(id: newebpay_response.result.merchant_order_no)
  #          .update_attributes!(payment_type: newebpay_response.result.payment_type, confirmed: true, confirmed_at: expired_at)

  #     flash[:info] =
  #       "Please transfer the money to bank code #{bank_code}, account number #{account_number} before #{I18n.l(expired_at)}"
  #   else
  #     Rails.logger.error "Newebpay Payment Code Receive Not Succeed: #{newebpay_response.status}: #{newebpay_response.message} (#{newebpay_response.result.to_json})"
  #     flash[:error] = "Our apologies, but an unexpected error occured, please try again"
  #   end
  
  #   redirect_to "https://2020staging.npp.vote/"
  # end
  #------------------------

  # # 定期定額委託單建立完成後使用者導回到網站觸發的callback。若不啟用，付款人將停留在藍新金流交易完成頁面
  # config.periodical_callback do |newebpay_response|
  # # 範例
  #   if newebpay_response.success?
  #     p "定期定額建立"
  #     flash[:success] = newebpay_response.message
  #   else
  #     flash[:error] = newebpay_response.message
  #   end
  #   redirect_to root_path
  # end

  # # 每期交易完成後觸發的callback，
  # config.periodical_notify_callback do |newebpay_response|
  #   p "定期定額notify"
  #   p "印出信用卡#{newebpay_response.result.period_no}"
  #   p "信用卡json #{newebpay_response.to_json}"
  #   if newebpay_response.success?
  #     # PerTransaction.find_by(period_no: newebpay_response.result.period_no)
  #         #  .update_attributes!(paid: true)
  #   else
  #     Rails.logger.info "Newebpay Periodical Not Succeed: #{newebpay_response.status}: #{newebpay_response.message} (#{newebpay_response.result.to_json})"
  #   end
  # end
  #-----------------------

  #捐款付款後觸發的callback。
  config.donation_notify_callback do |newebpay_response|
    p "捐款notify"
    
    if newebpay_response.success?
      p "交易成功"
      p "result======#{newebpay_response.result}"
      p "json======#{newebpay_response.to_json}"
      p "商店代號#{newebpay_response.result.merchant_order_no}"
      donation = Donation.find_by(id: newebpay_response.result.merchant_order_no)
      donation.update_attributes!(confirmed: true, confirmed_at: newebpay_response.result.pay_time, payment_type: newebpay_response.result.payment_type)
      total = System.first.total_donation.to_i + newebpay_response.result.amt.to_i
      System.first.update(total_donation: total )

      redirect_to "https://2020staging.npp.vote/"
    else
      p "交易狀態為 #{newebpay_response.success?}"
      p "交易失敗"
      Rails.logger.info "Newebpay Donation Not Succeed: #{newebpay_response.status}: #{newebpay_response.message} (#{newebpay_response.result.to_json})"
    end
  end
  #-----------------------

  # #信用卡取消授權批次處理的callback。
  # config.cancel_auth_notify_callback do |newebpay_response|
  #   if newebpay_response.valid?
  #   else
  #   end
  # end
end