export interface PostDetail {
    content: string;
}

export interface Post {
    title: string;
    postDetail: PostDetail;
}

export interface Sort {
    empty: boolean;
    sorted: boolean;
    unsorted: boolean;
}

export interface Pageable {
    pageNumber: number;
    pageSize: number;
    sort: Sort;
    offset: number;
    paged: boolean;
    unpaged: boolean;
}

export interface PostPage {
    totalPages: number;
    totalElements: number;
    first: boolean;
    last: boolean;
    size: number;
    content: Post[];
    number: number;
    sort: Sort;
    numberOfElements: number;
    pageable: Pageable;
    empty: boolean;
}