module StoresHelper
	def	store_status(store)
		if store.status == 1
			'营业中'
		else
			'停业中'
		end		
	end
end
