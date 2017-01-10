import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import tne.nexstep.dao.TravelIterinaryDetail;
import tne.nexstep.dao.TravelRequest;
import tne.utility.HibernateSession;


public class test {
	public static void main(String[] args) {
		
		Session session=null;
		session=HibernateSession.getSessionFactory().openSession();
		String trIdList = "23,24,22,25,26";
		String hql =  "from TravelRequest  " +
		" where travelRequestId in ("+trIdList+")";
		try {
			List<TravelRequest> travelRequestList = session.createQuery(hql).list();
			
			for (TravelRequest travelRequest : travelRequestList) {
				Set travelItinaryDO = travelRequest.getTravelIterinaryDetails();
				List travelItinaryDOList = new ArrayList(travelItinaryDO);
				for (Iterator iterator = travelItinaryDOList.iterator(); iterator.hasNext();) {
					TravelIterinaryDetail iterinaryDetail = (TravelIterinaryDetail) iterator.next();
					System.out.println(iterinaryDetail.getTravelIterinaryDetailId());
					
				}
			}
		
		
		
		
		
		} catch (Exception e) {
			System.out.println(e);
		}



	}
}
