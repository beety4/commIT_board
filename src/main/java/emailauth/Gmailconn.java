package emailauth;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmailconn extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("202244016@itc.ac.kr", "brjxolcmdymtukdu");
	}
}
