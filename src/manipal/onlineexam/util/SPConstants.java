package manipal.onlineexam.util;

import java.io.IOException;
import java.util.Properties;

/**
 * This class loads properties from given properties file and read properties
 * from it
 * 
 * @author Santosh Pawar	
 * 
 */
public class SPConstants {

	static SPConstants spCostants = null;
	Properties properties = null;

	/* Private Constructor */
	private SPConstants() {
		loadProperties();
	}

	/**
	 * This method returns instance of this class
	 * 
	 * @return KjerpConstants instance
	 */
	public static SPConstants getInstance() {

		if (spCostants == null) {
			spCostants = new SPConstants();

		}
		return spCostants;
	}

	/**
	 * This method loads given properties file
	 */
	public void loadProperties() {
		try {
			properties = new Properties();
			properties.load(SPConstants.class.getClassLoader()
					.getResourceAsStream("sp.properties"));
		} catch (IOException e) {
			System.out.println("Exception while loading kjerp.properties file");
			e.printStackTrace();
		}
	}

	/**
	 * This method returns the value for the given property
	 * 
	 * @param key
	 * @return value of the property
	 */
	public String getSpProperty(String key) {

		String value = Symbols.EMPTY.getSymbol();
		if (properties != null) {
			value = properties.getProperty(key);
		}

		return value;
	}

	/**
	 * This is test method. We can remove after testing this class
	 * 
	 * @param args
	 */
	public static void main(String args[]) {

		SPConstants kjerpConstants = null;
		kjerpConstants = SPConstants.getInstance();
		System.out.println("Property Value :"
				+ kjerpConstants.getSpProperty("path.name"));
	}
}
