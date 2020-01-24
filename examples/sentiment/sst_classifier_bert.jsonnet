local bert_model = "bert-base-uncased";

{
    "dataset_reader": {
        "type": "sst_with_tokenizer",
        "tokenizer": {
            "type": "pretrained_transformer",
            "model_name": bert_model,
        },
        "token_indexers": {
            "bert": {
                "type": "pretrained_transformer",
                "model_name": bert_model,
            }
        },
    },
    "train_data_path": "data/stanfordSentimentTreebank/trees/train.txt",
    "validation_data_path": "data/stanfordSentimentTreebank/trees/dev.txt",

    "model": {
        "type": "lstm_classifier",

        "embedder": {
            "token_embedders": {
                "bert": {
                    "type": "pretrained_transformer",
                    "model_name": bert_model
                }
            }
        },
        "encoder": {
            "type": "bert_pooler",
            "pretrained_model": bert_model,
            "requires_grad": false
        }
    },
    "iterator": {
        "type": "bucket",
        "batch_size": 8
    },
    "trainer": {
        "optimizer": {
            "type": "huggingface_adamw",
            "lr": 1.0e-5
        },
        "num_epochs": 10,
    }
}
