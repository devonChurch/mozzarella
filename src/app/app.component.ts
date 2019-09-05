import { Component } from "@angular/core";
import configuration from "../utils/configuration";

@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrls: ["./app.component.scss"]
})
export class AppComponent {
  title = "mozzarella";
  environment = configuration.environment;
  endpoint = configuration.endpoint;
}
