using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using Amazon.S3.Transfer;
using Microsoft.Maui.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace xclsvApp.Service
{
    public class AwsService
    {
        // szükséges AWS S3 hitelesítő adatok
        private const string accessKey = "AKIA6P46YOVXRJEEXSWY";
        private const string secretKey = "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";
        private const string bucketName = "xclsv-images";
        private static readonly RegionEndpoint bucketRegion = RegionEndpoint.EUNorth1;

        private readonly AmazonS3Client s3Client;

        public AwsService()
        {
            s3Client = new AmazonS3Client(accessKey, secretKey, bucketRegion);
        }

        // kép feltöltése az AWS S3 rendszerbe
        public async Task<string> UploadImageAsync(FileResult file)
        {
            if (file == null)
                return null;

            var fileStream = await file.OpenReadAsync();
            var fileName = $"{Guid.NewGuid()}_{file.FileName}";


            var uploadRequest = new TransferUtilityUploadRequest
            {
                InputStream = fileStream,
                Key = fileName,
                BucketName = bucketName
            };

            var transferUtility = new TransferUtility(s3Client);
            await transferUtility.UploadAsync(uploadRequest);

            // Ez lesz a fájl elérési útja az AWS S3 rendszerben
            return $"https://{bucketName}.s3.{bucketRegion.SystemName}.amazonaws.com/{fileName}";
        }
    }
}
