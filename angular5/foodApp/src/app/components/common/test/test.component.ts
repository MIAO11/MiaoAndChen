import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
// import { ToastService } from '../toast/toast.service';
// import { ToastType, ToastConfig } from '../toast/toast-model';


@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.scss']
})
export class TestComponent implements OnInit {
  @Input() dayItemDataList: any;
  constructor(private router: Router,
  // private toastService:ToastService,
  ) { }

  ngOnInit() {

  }

  goDetail(item){
    //  const toastCfg = new ToastConfig(ToastType.SUCCESS, '', '测试成功', 3000);
    //  this.toastService.toast(toastCfg);
    console.log(item);
    this.router.navigate(['/detail',item.htmlId]);
  }

}
