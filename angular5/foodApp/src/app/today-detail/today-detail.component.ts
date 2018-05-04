import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { homeService } from '../provider/biz/homeService';

@Component({
  selector: 'app-today-detail',
  templateUrl: './today-detail.component.html',
  styleUrls: ['./today-detail.component.scss']
})
export class TodayDetailComponent implements OnInit {
  htmlId;
  html;
  constructor(
    private homeservice: homeService,
    private route: ActivatedRoute) {

     }

  ngOnInit() {
    this.route.params.subscribe((params) => {
      this.htmlId=params.htmlId;
      this.homeservice.todayDetail({htmlId:this.htmlId}).subscribe((data: any) => {
        this.html = data.html;
        console.log(data);
     });

  });
  }

}
