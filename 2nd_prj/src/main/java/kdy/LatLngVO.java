package kdy;

public class LatLngVO {
	private double lat,lng;

	public LatLngVO() {
		super();
	}

	public LatLngVO(double lat, double lng) {
		super();
		this.lat = lat;
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "LatLngVO [lat=" + lat + ", lng=" + lng + "]";
	}
	
	
}
