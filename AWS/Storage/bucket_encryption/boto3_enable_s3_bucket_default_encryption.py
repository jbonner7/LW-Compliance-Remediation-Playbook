import boto3
client = boto3.client('s3')

Buckets = ['bucket-name']

for bucket in Buckets:
      response = client.put_bucket_encryption(Bucket= bucket, ServerSideEncryptionConfiguration={'Rules': [{'ApplyServerSideEncryptionByDefault': {'SSEAlgorithm': 'AES256'}},]})
