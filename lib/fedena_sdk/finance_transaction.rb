module FedenaSdk
  class FinanceTransaction < Model
    attr_accessor :title, :description, :amount, :fine_included, :transaction_date, :fine_amount,
                  :master_transaction, :finance, :payee, :receipt_no, :voucher_no
  end
end
