import { Component } from '@angular/core';
import { homeService } from './provider/biz/homeService';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  items;
  constructor( private homeservice: homeService) {
  }
  title = 'angular web开发';

    // tslint:disable-next-line:use-life-cycle-interface
    ngOnInit() {
      this.homeservice.patientIndexInfo({}).subscribe((data: any) => {
         this.items = data.dayDataList;
         console.log(data);
      });
   }

}
