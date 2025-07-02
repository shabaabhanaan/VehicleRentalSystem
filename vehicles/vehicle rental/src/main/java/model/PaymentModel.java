package model;

public class PaymentModel {
    private int id;
    private String cardNumber;
    private String cvv;
    private String expireDate;
    private String cardName;
    private String email;
    
    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCardNumber() { return cardNumber; }
    public void setCardNumber(String cardNumber) { this.cardNumber = cardNumber; }

    public String getCvv() {
    	return cvv; 
    	}
    
    public void setCvv(String cvv) { this.cvv = cvv; }

    public String getExpireDate() { return expireDate; }
    public void setExpireDate(String expireDate) { this.expireDate = expireDate; }

    public String getCardName() { return cardName; }
    public void setCardName(String cardName) { this.cardName = cardName; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
