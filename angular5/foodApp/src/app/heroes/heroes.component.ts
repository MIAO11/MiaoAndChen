import { Component, OnInit } from '@angular/core';
import { homeService } from '../provider/biz/homeService';
import { SpinService } from '../components/common/spin/spin.service';


@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrls: ['./heroes.component.scss']
})
export class HeroesComponent implements OnInit {
  dayItemDataList;
  items = [];
  constructor(
    private homeservice: homeService,
    private spinService: SpinService,
  ) { }

  ngOnInit() {
    this.homeservice.patientIndexInfo({}).subscribe((data: any) => {
      this.items = data.dayDataList;
      console.log(data);
   });
  }
  onSelect(item): void {
    this.dayItemDataList = item.dayItemDataList;
    // this.spinService.spin(true);
    // console.log(item);
  }

}
