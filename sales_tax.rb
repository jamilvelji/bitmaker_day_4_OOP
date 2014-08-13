class SalesTax
	attr_accessor :print_receipt
	SALES_TAX = 0.10
	IMPORT_TAX = 0.05
	TAX_EXEMPT = ["chocolates", "books", "pills", "chocolate"]

	def initialize(receipt_array)
		@receipt_array = receipt_array
	end

	def print_receipt
		total_tax = 0
		total_price = 0

		@receipt_array.each do |receipt_item|
			item_split_array = receipt_item.split
			qty = item_split_array[0].to_i
			price = item_split_array[-1].to_f
			item_temporary = receipt_item.split(" at ")
			item = item_temporary[0].delete("/0-9/").strip
			tax = tax_calculator(price, item)
			total_tax += tax
			tax_price = (price.to_f + tax)
			total_price += tax_price
			p "#{qty} #{item}: #{tax_price.round(2)}"
		end
		p "Sales tax: #{total_tax.round(2)}"
		p "Total: #{total_price.round(2)}"
	end

	def tax_calculator(price, item)
		tax_excluded = []
		separated_items = item.split('')
		tax_excluded = separated_items & TAX_EXEMPT

		if item.include?("imported") and tax_excluded.length != 1
			tax = (price.to_f * SALES_TAX) * IMPORT_TAX
		elsif item.include?("imported") and tax_excluded.length == 1
			tax = price.to_f * IMPORT_TAX
		elsif tax_excluded.length != 1
			tax = price.to_f * SALES_TAX
		else
			tax = 0
		end
		return tax
	end
end

receipt1 = ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
receipt2 = ["1 imported box of chocolate at 10.00", "1 imported bottle of perfume at 47.50"]
receipt3 = ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]
receipt1_with_tax = SalesTax.new(receipt1)
puts "------ Receipt 1 Begins ------\n"
puts receipt1_with_tax.print_receipt
puts "\n------ Receipt 1 Ends ------\n\n"

receipt2_with_tax = SalesTax.new(receipt2)
puts "------ Receipt 2 Begins ------\n"
puts receipt2_with_tax.print_receipt
puts "\n------ Receipt 2 Ends ------\n\n"

receipt3_with_tax = SalesTax.new(receipt3)
puts "------ Receipt 3 Begins ------\n"
puts receipt3_with_tax.print_receipt
puts "\n------ Receipt 3 Ends ------\n\n"