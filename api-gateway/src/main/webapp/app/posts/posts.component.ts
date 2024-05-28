import {Component, inject, OnInit} from '@angular/core';
import {Post} from "./post.model";
import {PostService} from "./post.service";
import {PostComponent} from "./post/post.component";
import {DataViewModule} from 'primeng/dataview';
import {NgForOf, NgIf} from "@angular/common";
import {InfiniteScrollModule} from "ngx-infinite-scroll";

@Component({
    selector: 'app-posts',
    standalone: true,
    imports: [
        PostComponent, DataViewModule, NgForOf, InfiniteScrollModule, NgIf
    ],
    templateUrl: './posts.component.html',
    styleUrl: './posts.component.css'
})
export class PostsComponent implements OnInit {
    private postService: PostService = inject(PostService);

    posts: Post[] = [];
    isLoading = false;
    currentPage = 0;
    itemsPerPage = 10;

    ngOnInit(): void {
        this.loadData();
    }

    toggleLoading = () => this.isLoading = !this.isLoading;

    // it will be called when this component gets initialized.
    loadData = () => {
        this.toggleLoading();
        this.postService.findAll(this.currentPage, this.itemsPerPage).subscribe({
            next: postPage => {
                this.posts.push(...postPage.content);
            },
            error: err => console.log(err),
            complete: () => this.toggleLoading()
        })
    }

    appendData = () => {
        this.toggleLoading();
        this.postService.findAll(this.currentPage, this.itemsPerPage).subscribe({
            next: postPage => {
                this.posts.push(...this.posts, ...postPage.content);
            },
            error: err => console.log(err),
            complete: () => this.toggleLoading()
        })
    }

    onScroll = () => {
        console.log('on scroll');
        this.currentPage++;
        this.appendData();
    }
}
