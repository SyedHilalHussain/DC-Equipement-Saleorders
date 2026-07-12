page 50100 SalesOrderAPIV2
{
    PageType = API;
    DelayedInsert = true;
    APIPublisher = 'dce';
    APIGroup = 'integration';
    APIVersion = 'v1.0';
    EntityName = 'salesOrder';
    EntitySetName = 'salesOrders';
    SourceTable = "Sales Header";
    // Only sales orders (not quotes / blanket orders) for this API.
    SourceTableView = where("Document Type"=const(Order));
    ODataKeyFields = SystemId;
    Caption = 'Sales Order (FS integration)';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // --- Keys / identity ---
                field(id; Rec.SystemId)
                {
                    Editable = false;
                }
                // Read-only on API so POST/insert does not send number="". Empty No. caused Internal_RecordNotFound (Sales Header ... No.='').
                field(number; Rec."No.")
                {
                    Editable = false;
                }
                field(status; Rec.Status)
                {
                    Editable = false;
                }
                // --- Customer / sell-to ---
                field(customerNumber; Rec."Sell-to Customer No.")
                {
                }
                field(customerName; Rec."Sell-to Customer Name")
                {
                }
                field(contact; Rec."Sell-to Contact")
                {
                }
                field(sellToContactNo; Rec."Sell-to Contact No.")
                {
                }
                field(phoneNumber; Rec."Sell-to Phone No.")
                {
                }
                field(email; Rec."Sell-to E-Mail")
                {
                }
                // --- Bill-to ---
                field(billToCustomerNumber; Rec."Bill-to Customer No.")
                {
                }
                field(billToName; Rec."Bill-to Name")
                {
                }
                field(billToContact; Rec."Bill-to Contact")
                {
                }
                field(billToContactNo; Rec."Bill-to Contact No.")
                {
                }
                // --- Ship-to ---
                field(shipToName; Rec."Ship-to Name")
                {
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                }
                // --- Addresses (sell / bill / ship) ---
                field(sellToAddressLine1; Rec."Sell-to Address")
                {
                }
                field(sellToAddressLine2; Rec."Sell-to Address 2")
                {
                }
                field(sellToCity; Rec."Sell-to City")
                {
                }
                field(sellToCountry; Rec."Sell-to Country/Region Code")
                {
                }
                field(sellToState; Rec."Sell-to County")
                {
                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                {
                }
                field(billToAddressLine1; Rec."Bill-to Address")
                {
                }
                field(billToAddressLine2; Rec."Bill-to Address 2")
                {
                }
                field(billToCity; Rec."Bill-to City")
                {
                }
                field(billToCountry; Rec."Bill-to Country/Region Code")
                {
                }
                field(billToState; Rec."Bill-to County")
                {
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                {
                }
                field(shipToAddressLine1; Rec."Ship-to Address")
                {
                }
                field(shipToAddressLine2; Rec."Ship-to Address 2")
                {
                }
                field(shipToCity; Rec."Ship-to City")
                {
                }
                field(shipToCountry; Rec."Ship-to Country/Region Code")
                {
                }
                field(shipToState; Rec."Ship-to County")
                {
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                }
                // --- Document / dates ---
                field(documentDate; Rec."Document Date")
                {
                }
                field(orderDate; Rec."Order Date")
                {
                }
                field(postingDate; Rec."Posting Date")
                {
                }
                field(dueDate; Rec."Due Date")
                {
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                {
                }
                field(promisedDeliveryDate; Rec."Promised Delivery Date")
                {
                }
                // --- References ---
                field(quoteNumber; Rec."Quote No.")
                {
                }
                field(externalDocumentNumber; Rec."External Document No.")
                {
                }
                field(yourReference; Rec."Your Reference")
                {
                }
                // --- Commercial ---
                field(currencyCode; Rec."Currency Code")
                {
                }
                field(pricesIncludeTax; Rec."Prices Including VAT")
                {
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                }
                field(locationCode; Rec."Location Code")
                {
                }
                field(salesperson; Rec."Salesperson Code")
                {
                }
                field(discountAmount; Rec."Invoice Discount Amount")
                {
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                }
                // --- Work order / notes: use the SAME field names as on your Sales Order page / table extension.
                // If compile fails here, replace with your actual field identifiers (e.g. "FS Work Order No.").
                field(workOrderNumber; Rec."DCE Work Order No.")
                {
                }
                field(customerNotes; Rec."DCE Print Customer Notes")
                {
                }
                // --- Work description (blob via standard pattern) ---
                field(workDescription; WorkDescriptionText)
                {
                    trigger OnValidate()
                    begin
                        Rec.SetWorkDescription(WorkDescriptionText);
                    end;
                }
                // --- Equipment / FS fields (must exist on Sales Header in your app) ---
                field(equipmentType; Rec."Equipment Type")
                {
                }
                field(manufacturer; Rec."Manufacturer")
                {
                }
                field(model; Rec."Model")
                {
                }
                field(serialNo; Rec."Serial No")
                {
                }
                field(assetTagNo; Rec."Asset Tag No")
                {
                }
                field(hourMeterReading; Rec."Hour Meter Reading")
                {
                }
                field(technicianName; Rec."Technician Name")
                {
                }
                field(workSummary; Rec."Work Summary")
                {
                }
                field(incidentDescription; Rec."Incident Description")
                {
                }
                field(poNumber; Rec."PO Number")
                {
                }
                field(orderCompletionDate; Rec."Order Completion Date")
                {
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        WorkDescriptionText:=Rec.GetWorkDescription();
    end;
    var WorkDescriptionText: Text;
}
