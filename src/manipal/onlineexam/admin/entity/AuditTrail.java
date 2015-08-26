package manipal.onlineexam.admin.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


@Entity
public class AuditTrail {

	@Id
	@GeneratedValue
	int audiId;
	String event;
	
	
}
