
Procedure ChoiceDataGetProcessing(ChoiceData, Parameters, StandardProcessing)
	StandardProcessing = False;
	ChoiceData = New ValueList();
	ChoiceData.Add(Enums.IncomingPaymentTransactionType.PaymentFromCustomer);
	ChoiceData.Add(Enums.IncomingPaymentTransactionType.CurrencyExchange);
	ChoiceData.Add(Enums.IncomingPaymentTransactionType.CashTransferOrder);
	ChoiceData.Add(Enums.IncomingPaymentTransactionType.TransferFromPOS);
	ChoiceData.Add(Enums.IncomingPaymentTransactionType.ReturnFromVendor);
	If Parameters.Filter.Property("Ref") And TypeOf(Parameters.Filter.Ref) = Type("DocumentRef.BankReceipt") Then
		ChoiceData.Add(Enums.IncomingPaymentTransactionType.PaymentFromCustomerByPOS);
		ChoiceData.Add(Enums.IncomingPaymentTransactionType.ReceiptByCheque);
	EndIf;
EndProcedure
