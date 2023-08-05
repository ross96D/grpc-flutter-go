package controllers

import (
	"context"
	"time"

	db "grpc-flutter/backend/database"
	p "grpc-flutter/backend/generated/grpc"
	"grpc-flutter/backend/utils"
)

type BookServiceServer struct {
	p.UnimplementedBookServiceServer
}

func (BookServiceServer) GetAllBooks(params *p.GetAllBooksParams, w p.BookService_GetAllBooksServer) error {
	tx, err := db.BeginTx(db.BeginTxParams{Ctx: w.Context()})
	if err != nil {
		println("Error beggining transaction\n", err)
		w.Context().Done()
		return nil
	}
	rows, err := tx.Query("SELECT * FROM book")
	if err != nil {
		println("Error fetching data\n", err)
		w.Context().Done()
		return nil
	}
	var (
		id          int32
		author_id   int32
		price       float32
		cover_url   string
		date_out    time.Time
		description string
		title       string
	)
	for rows.Next() {
		if err := rows.Scan(&id, &author_id, &price, &cover_url, &date_out, &description, &title); err != nil {
			println("Error reading data\n", err)
			rows.Close()
			w.Context().Err()
			return nil
		}
		price = float32(utils.RoundTo(float64(price), 2))
		w.Send(&p.Book{
			Id: id,
			Author: &p.Author{
				Id: author_id,
			},
			CoverUrl:    cover_url,
			Price:       price,
			Title:       title,
			Description: description,
			DateOut:     date_out.UnixMilli(),
		})
	}
	return nil
}

func (BookServiceServer) GetBook(ctx context.Context, params *p.GetBookParams) (*p.Book, error) {
	return &p.Book{Id: 1}, nil
}

func (BookServiceServer) SearchBooks(params *p.SearchBooksParams, w p.BookService_SearchBooksServer) error {
	for i := 0; i < 10; i++ {
		if err := w.Send(&p.Book{
			Id:       int32(i),
			CoverUrl: "NO TIENE",
		}); err != nil {
			return err
		}
	}
	return nil
}
