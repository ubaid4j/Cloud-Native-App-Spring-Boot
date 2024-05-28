import {inject, Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {PostPage} from "./post.model";

@Injectable({
    providedIn: 'root'
})
export class PostService {
    private http: HttpClient = inject(HttpClient);
    
    findAll(pageNumber: number, size: number): Observable<PostPage> {
        return this.http.get<PostPage>(`/post-service/api/post?page=${pageNumber}&size=${size}&sort=desc`);
    }
}
