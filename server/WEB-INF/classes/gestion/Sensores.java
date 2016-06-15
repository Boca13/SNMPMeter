package gestion;

import java.util.*;

public class Sensores {
	public List<Sensor> sensores = new LinkedList<Sensor>();

	public int buscar(String id){
		int c;
		for(c=0; c<sensores.size(); c++){
			if(sensores.get(c).id.equals(id))
				break;
		}
		if(c==sensores.size())
			c=-1;
		return c;
	}
	
}
