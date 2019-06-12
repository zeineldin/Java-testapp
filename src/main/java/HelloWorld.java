import spark.servlet.SparkApplication;

import static spark.Spark.get;

public class HelloWorld implements SparkApplication {
	public static void main(String[] args) {
		new HelloWorld().init();
	}

	@Override
	public void init() {
		get("/", (req, res) -> "DevOpsArea Java Sample Projects 21.06.2019 ");
	}
}
